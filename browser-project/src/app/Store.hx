package app;

class Store<S>{
  private var state:S;

  public function getState():S{
    return state
  }
}