from collections import OrderedDict
import json
import inflect
import sys

p = inflect.engine()

cols = [OrderedDict([
        ("parent_coll_name" , "/tempZone/home/rods"),
        ("coll_name" , "/tempZone/home/rods/a"),
        ("coll_owner_name" , "rods"),
        ("coll_owner_zone" , "tempZone"),
        ("coll_map_id" , 0),
        ("coll_inheritance" , ""),
        ("coll_type" , ""),
        ("coll_info1" , ""),
        ("coll_info2" , ""),
        ("coll_expiry_ts" , ""),
        ("r_comment" , ""),
        ("create_ts" , "0"),
        ("modify_ts" , "0")
        ])]

for i in range(int(sys.argv[1])):
    col = OrderedDict([
        ("parent_coll_name" , "/tempZone/home/rods/a"),
        ("coll_name" , "/tempZone/home/rods/a/" + p.number_to_words(i)),
        ("coll_owner_name" , "rods"),
        ("coll_owner_zone" , "tempZone"),
        ("coll_map_id" , 0),
        ("coll_inheritance" , ""),
        ("coll_type" , ""),
        ("coll_info1" , ""),
        ("coll_info2" , ""),
        ("coll_expiry_ts" , ""),
        ("r_comment" , ""),
        ("create_ts" , "0"),
        ("modify_ts" , "0")
        ])
    cols.append(col)

data_objs = []
large = OrderedDict([
    ("parallel" , True),
    ("collections" , cols),
    ("data_objects" , data_objs)
    ])

largeserial = OrderedDict([
    ("parallel" , False),
    ("collections" , cols),
    ("data_objects" , data_objs)
    ])

with open("inputlarge.json", "w") as file:
    json.dump(large, file)

with open("inputlargeserial.json", "w") as file:
    json.dump(largeserial, file)

