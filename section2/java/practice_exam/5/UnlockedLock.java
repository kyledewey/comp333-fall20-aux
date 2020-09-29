public class UnlockedLock implements Lock {
    public UnlockedLock() {}
    
    public Lock unlock() {
        System.out.println("lock already unlocked");
        return this;
        //return new UnlockedLock();
    }
    
    public Lock lock() {
        System.out.println("lock locked");
        //return new Lock(true);
        return new LockedLock();
    }
    
    public boolean isLocked() {
        return false;
    }
} // UnlockedLock
