def allparameter(part1, part2=1, *numbers, **keywords):
    '''example code to show all kinds of parameter that python could use. 
       normal parameter like part1,
       default value parameter like part2,
       varing length parameters like numbers
       and hash list like keywords'''
    for i in range(1,part1):
        print (i-1)*'\t','looping part1:[{0}]'.format(i)
        for j in range(1,part2):
            print (j-1)*'\t','looping part2:[{0}]'.format(j)
            for n in numbers:
                print (j-1)*'\t',n
            for key in keywords:
                print (j-1)*'\t',key, keywords[key]

allparameter(2, 3, 1, 3, 5, 7, 9, Dec=12, Nov=11, Oct=10)
print allparameter.__doc__
