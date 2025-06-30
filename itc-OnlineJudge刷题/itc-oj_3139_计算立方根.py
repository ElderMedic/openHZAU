def calculate_output(a):
    # 电话键盘数字对应的字母数量映射
    keypad = {'0':0, '1':0, '2':3, '3':3, '4':3, 
              '5':3, '6':3, '7':4, '8':3, '9':4}
    total = sum(keypad[d] for d in str(a))
    return total ** 3

a = int(input())
print(calculate_output(a))