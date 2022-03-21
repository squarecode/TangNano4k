## Example Projects for the Tang-Nano-4K Board
# Dependencies
You will need the following tools to build the projects:
<ol>
    <li>yosys</li>
    <li>nextpnr-gowin</li>
    <li>gowin_pack</li>
    <li>openFPGALoader (Make sure, that your Version includes the tangnano4k Board)</li>
</ol>

# Building
Use `make` to build one of the projects.
With `make prog` you can test the result on your TangNano4k (for writing to the onboard Flash see openFPGALoader docs)