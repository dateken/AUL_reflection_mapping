local filename =
{
    "r01.obj","r02.obj","r03.obj","r04.obj","r05.obj",
    "s01.obj","s02.obj","s03.obj","s04.obj","s05.obj","s06.obj","s07.obj","s08.obj","s09.obj","s10.obj","s11.obj","s12L.obj","s12R.obj","s13L.obj","s13R.obj",
    "p03.obj","p04.obj","p05.obj","p06.obj","p07.obj","p08.obj","p09.obj","p10.obj",
    "a03.obj","a04.obj","a05.obj","a06.obj","a07.obj","a08.obj","a09.obj","a10.obj",
    "n01.obj","n02.obj","n03.obj","n04.obj","n05.obj","n06.obj","n07.obj","n08.obj","n09.obj","n10.obj",
    "n11.obj","n12.obj","n13.obj","n14.obj","n15.obj","n16.obj","n17.obj","n18.obj","n19.obj","n20.obj",
    "n21.obj","n22.obj","n23.obj","n24.obj","n25.obj","n26.obj","n27.obj","n28.obj","n29.obj","n30.obj",
    "n31.obj","n32.obj","n33.obj","n34.obj","n35.obj","n36.obj","n37.obj","n38.obj","n39.obj","n40.obj",
    "n41.obj","n42.obj","n43.obj","n44L.obj","n44R.obj","n45L.obj","n45R.obj","n46L.obj","n46R.obj","n47L.obj","n47R.obj","n48L.obj","n48R.obj","n49.obj","n50.obj",
    "n51.obj","n52.obj","n53.obj","n54.obj","n55.obj","n56.obj","n57.obj","n58.obj","n59.obj","n60.obj",
    "n61.obj","n62.obj","n63.obj","n64.obj","n65.obj","n66.obj","n67.obj","n68.obj","n69.obj","n70.obj",
    "n71.obj","n72.obj","n73.obj","n74.obj","n75.obj","n76.obj","n77.obj","n78.obj","n79.obj","n80.obj",
    "n81.obj","n82.obj","n83.obj","n84.obj","n85.obj","n86.obj","n87.obj","n88.obj","n89.obj","n90.obj",
    "n91.obj","n92.obj"
}

local function split(str, d)
    if d == nil then return {} end
    local type
    local array = {}
    local i=1
    for s in string.gmatch(str, "([^"..d.."]+)") do

        if (i == 1) then
            type = s
        else
            array[#array+1] = tonumber(s)
        end
        i = i+1
    end

    return type,array
end

local Polyhedron = {}

Polyhedron.read = function(id)
    local fp = io.open(".\\script\\polyhedrons_obj\\"..filename[id],"r")
    local v = {}
    local f = {}
    for l in fp:lines() do
        local type,array
        type,array = split(l," ")

        if type == "v" then
            v[#v+1] = array
        else
            f[#f+1] = array
        end
    end
    fp:close()
    return v,f
end

return Polyhedron