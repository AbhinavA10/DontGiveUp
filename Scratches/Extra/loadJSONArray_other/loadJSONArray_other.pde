//https://processing.org/reference/loadJSONArray_.html
// Example of JSON code, objects are in "{ }", which are in an array
// [
//   {
//     "id": 0,
//     "species": "Capra hircus",
//     "name": "Goat"
//   },
//   {
//     "id": 1,
//     "species": "Panthera pardus",
//     "name": "Leopard"
//   },
//   {
//     "id": 2,
//     "species": "Equus zebra",
//     "name": "Zebra"
//   }
// ]                                   
JSONArray jsonArValues;
JSONObject jsonObjItems;
String[] arSFileNames = new String[3];
int nCount=0;

void setup() {
  for (int i = 0; i<3; i++) {
    arSFileNames[i] = "data/data"+ str(i+1)+".JSON";
  }
  size(900, 600);
}
void draw() {
}
void mousePressed() {  
  if (nCount==2)  exit();
  json();
  nCount++;
}
void json() {  
  jsonArValues = loadJSONArray(arSFileNames[nCount]);
    println(" "+int(nCount+1)+".");
  for (int j = 0; j < jsonArValues.size(); j++) {
    jsonObjItems = jsonArValues.getJSONObject(j); 

    int nId = jsonObjItems.getInt("id");
    String sSpecies = jsonObjItems.getString("species");
    String sName = jsonObjItems.getString("name");
    boolean bCool = jsonObjItems.getBoolean("Is Cool");

    println(nId + ", " + sSpecies + ", " + sName + ", is Cool? - "+bCool);
  }
  println();
}
// Sketch prints:
/*
0, Capra hircus, Goat, is Cool? - true
 1, Panthera pardus, Leopard, is Cool? - false
 1, Fierce King, Lion, is Cool? - true
 2, Equus zebra, Zebra, is Cool? - true
 3, Abra Kadabra, Magician, is Cool? - true
 
 3, Smart, Ironman, is Cool? - true
 4, Brooding, Batman, is Cool? - true
 2, Smart, HULK, is Cool? - true
 7, Blind, Daredevil, is Cool? - true
 1, Funny, Spiderman, is Cool? - true
 
 6, Superfast, Lambo, is Cool? - true
 4, Too Fast, Venom, is Cool? - false
 3, Heavy, Challenger, is Cool? - true
 1, Muscle, Camaro, is Cool? - true
 0, Muscle, Shelby, is Cool? - true
 */