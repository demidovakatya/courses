def longestRun(L):

    max_len = 0

    for sub_len in range(len(L), 0, -1):
        sub_lists = getSublists(L, sub_len)
        for sub_list in sub_lists:
            # print(sub_list)
            # print(sorted(sub_list))
            # print(sub_list == sorted(sub_list))
            if sub_list == sorted(sub_list):
                max_len = sub_len
                return max_len
                break
   

