
enum PriorityModel {
 low(1),
 medium(2),
 high(3);

 const PriorityModel(this.value);

 final int value;

 String get name {
  return toString().split('.').last;
 }

 static PriorityModel? getByIndex(int index) {
  const values = PriorityModel.values;
  if (index >= 0 && index < values.length) {
   return values[index];
  }
  return null;
 }

}
