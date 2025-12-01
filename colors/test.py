color = input()
# Color
print("\"#", end = "")
for value in color[6:-1].split(",")[0:3]:
    print(str(hex(int(255*float(value))))[2:], end="")
print("\"")

for value in color[6:-1].split(",")[0:3]:
    print(hex(int(255*float(value))))
