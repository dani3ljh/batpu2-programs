# for testing my draw.as for the batpu2
reg = {"r1": 0, "r2": 0, "r3": 0, "r4": 0, "r5": 0, "r6": 0, "r7": 0, "r8": 0, "r9": 0, "r10": 0}

def printRegisters(maxReg):
    if maxReg >= 1:
        print(reg["r1"], end=", ")
    if maxReg >= 2:
        print(reg["r2"], end=", ")
    if maxReg >= 3:
        print(reg["r3"], end=", ")
    if maxReg >= 4:
        print(reg["r4"], end=", ")
    if maxReg >= 5:
        print(reg["r5"], end=", ")
    if maxReg >= 6:
        print(reg["r6"], end=", ")
    if maxReg >= 7:
        print(reg["r7"], end=", ")
    if maxReg >= 8:
        print(reg["r8"], end=", ")
    if maxReg >= 9:
        print(reg["r9"], end=", ")
    if maxReg >= 10:
        print(reg["r10"], end=", ")
    print()
    
def drawLine():
    # reg["r5"] = dx = x0 - x1
    reg["r5"] = reg["r3"] - reg["r1"]

    # 2*dy
    reg["r6"] = reg["r4"] - reg["r2"]
    reg["r6"] *= 2

	# p = 2*dy - dx
    reg["r7"] = reg["r6"] - reg["r5"]

	# reg["r5"] = 2*dx
    reg["r5"] *= 2

    while(True):
        printRegisters(7)
        if reg["r7"] > 0:
            reg["r2"] += 1
            reg["r7"] -= reg["r5"]
        
        reg["r7"] += reg["r6"]

        reg["r1"] += 1

        if reg["r1"] > reg["r3"]:
            break

reg["r1"] = 0; reg["r2"] = 0
reg["r3"] = 5; reg["r4"] = 3
drawLine()