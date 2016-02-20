def item_order(order):
    num_water = order.count("water")
    num_salad = order.count("salad")
    num_ham = order.count("hamburger")

    return("salad:" + str(num_salad) + " hamburger:" + str(num_ham) + " water:" + str(num_water))
