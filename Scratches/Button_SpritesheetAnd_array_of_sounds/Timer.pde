
class Timer {
  int nTimerLength;
  int nTimeAtTimerStart;     
  int nTimeSinceTimerStarted ;
  // ============== CONSTRUCTOR =============================================
  Timer(int nTempTimerLength) {
    nTimerLength=nTempTimerLength;
    // textAlign(LEFT, CENTER);
    fill(0);
  } // ============== START =============================================
  void start() {
    nTimeAtTimerStart=millis();
  }
  // ============== IS-REACHED-TIME=============================================
  boolean isReachedTime() { 
    // Check how much time has passed
    nTimeSinceTimerStarted = millis() - nTimeAtTimerStart;
    if (nTimeSinceTimerStarted >= nTimerLength) {
      return true;
    } else {
      return false;
    }
  }
}