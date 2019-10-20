VectorOperation = {}

--ベクトルの和
VectorOperation.add = function(u,v)
    local x = u[1] + v[1]
    local y = u[2] + v[2]
    local z = u[3] + v[3]
    return {x,y,z}
end

--ベクトルの差
VectorOperation.sub = function(u,v)
    local x = u[1] - v[1]
    local y = u[2] - v[2]
    local z = u[3] - v[3]
    return {x,y,z}
end

--単位ベクトル
VectorOperation.unit = function(v)
    local x = v[1]
    local y = v[2]
    local z = v[3]
    local l = (x*x + y*y + z*z)^0.5
    return {x/l, y/l, z/l}
end

--内積
VectorOperation.dot = function(u,v)
    local x1 = u[1]
    local y1 = u[2]
    local z1 = u[3]
    local x2 = v[1]
    local y2 = v[2]
    local z2 = v[3]
    return x1*x2 + y1*y2 + z1*z2
end

--外積
VectorOperation.cross = function(u,v)
    local x1 = u[1]
    local y1 = u[2]
    local z1 = u[3]
    local x2 = v[1]
    local y2 = v[2]
    local z2 = v[3]
    return {y1*z2 - z1*y2, z1*x2 - x1*z2, x1*y2 - y1*x2}
end

--クォータニオン
VectorOperation.qt = function(axis,degree)
    local theta = degree*math.pi/180*0.5
    local cos = math.cos(theta)
    local sin = math.sin(theta)
    local x = axis[1]
    local y = axis[2]
    local z = axis[3]
    local l = (x*x + y*y + z*z)^0.5
    return {x * sin / l, y * sin / l, z * sin / l, cos}
end

--クォータニオンによる座標回転
VectorOperation.rotate = function(pos,q)
    local x = pos[1]
    local y = pos[2]
    local z = pos[3]
    local qx = q[1]
    local qy = q[2]
    local qz = q[3]
    local qr = q[4]
    local x_= qr*x+qy*z-qz*y
    local y_= qr*y+qz*x-qx*z
    local z_= qr*z+qx*y-qy*x
    local r_= -qx*x-qy*y-qz*z
    return {-r_*qx+qr*x_-y_*qz+z_*qy, -r_*qy+qr*y_-z_*qx+x_*qz, -r_*qz+qr*z_-x_*qy+y_*qx}
end

--クォータニオンの積
VectorOperation.qq = function(qa, qb)
    local pw = qa[4]
    local px = qa[1]
    local py = qa[2]
    local pz = qa[3]

    local qw = qb[4]
    local qx = qb[1]
    local qy = qb[2]
    local qz = qb[3]

    local uvw = pw * qw - px * qx - py * qy - pz * qz
    local uvx = pw * qx + px * qw + py * qz - pz * qy
    local uvy = pw * qy - px * qz + py * qw + pz * qx
    local uvz = pw * qz + px * qy - py * qx + pz * qw

    return {uvx,uvy,uvz,uvw}
end

return VectorOperation