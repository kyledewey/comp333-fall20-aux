public class LockedLock implements Lock {
    public LockedLock() {}
    
    public Lock unlock() {
        System.out.println("lock unlocked");
        //return new Lock(false);
        return new UnlockedLock();
    }
    
    public Lock lock() {
        System.out.println("lock already locked");
        return this;
        //return new LockedLock();
    }
    
    public boolean isLocked() {
        return true;
    }
} // LockedLock
    
