package bitmap.support;

class ArrayExtensions {
  /** Returns a random number between a (inclusive) and b (exclusive). */
  public static function find <T>(a:Array<T>, predicate:(t:T)->Bool) {
    for(i in a) {
      if(predicate(i)){
        return i;
      }
    }
    return null;
  }
}