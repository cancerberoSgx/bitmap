package bitmap.support;

class ArrayExtensions {
  public static function find <T>(a:Array<T>, predicate:(t:T)->Bool) {
    for(i in a) {
      if(predicate(i)){
        return i;
      }
    }
    return null;
  }
  public static function findIndexOf <T>(a:Array<T>, predicate:(t:T)->Bool, from=0) {
    for(i in from...a.length) {
      if(predicate(a[i])){
        return i;
      }
    }
    return -1;
  }
}