/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entities;

import java.io.Serializable;

/**
 *
 * @author jcvsa
 */
public class UserKey implements Serializable {
    
    public String uName; 
    
    public UserKey() { 
        
    }
    
    public UserKey(String uName) { 
        this.uName = uName; 
    }

    
//    @Override
//    public int hashCode() {
//        int hash = 0;
//        hash += (id != null ? id.hashCode() : 0);
//        return hash;
//    }
//
//    @Override
//    public boolean equals(Object object) {
//        // TODO: Warning - this method won't work in the case the id fields are not set
//        if (!(object instanceof UserKey)) {
//            return false;
//        }
//        UserKey other = (UserKey) object;
//        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
//            return false;
//        }
//        return true;
//    }
//
//    @Override
//    public String toString() {
//        return "Entities.UserKey[ id=" + id + " ]";
//    }
    
}
