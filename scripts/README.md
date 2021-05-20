Scripts for Initializing AppWrite database with dummy data.

**Instrcitons for adding json :**

Follow the below schema, more relevent fields can be added

Category

```json
ex:
{
  "categoryId": "06315c03-8fdd-4411-bacd-8c101afacb2a",
  "name": "Pizza"
}
```

FoodItem

```json
{
  "itemId": "", // UUID v4 must be generated from https://www.uuidgenerator.net/version4
  "name": "", // ex: Margheritta, Veg Loaded, Corn , Cheese
 "category" : "pizza", // "burger" , "dessert"
  "ingreditents": [], //ex : "Jalepeno", "chilli", "peppers", "zuchini"
  "price": , // ex : in rupees 199, 439
  "tags": [], // ex : Meal of the day, hot , trending
  "isVeg": , // ex : true or false
  "isEgg": , // ex : true or false
  "type": "", // ex : Thin crust, Cheese Burst, thick crust, Hand Tossed, Pan
  "style": "", //  ex: Spanish, Itanlino, Indian, Greece, Mexican
  "discount": , // ex: in Integer 30, 40, 50,
  "imageUrl": "", //  imageUrl from Appwrite Storage bucket
  "arModelUrl": "" //  Ar model linl from appwrite storage bucket
}
```

Images should go into the /data/images folder

```json
{
  "imageId": "", // UUID v4 must be generated from https://www.uuidgenerator.net/version4,
  "imageName": ""
}
```
