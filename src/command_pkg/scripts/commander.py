#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from command_pkg.msg import sermon

class SendingNode:
    def __init__(self) -> None:
        rospy.init_node('COMMANDER',anonymous=True)
        self.pub=rospy.Publisher('command',sermon,queue_size=1)
        rospy.Subscriber('button_er_value',sermon,self.clbk)
    
    def clbk(self,data):
        self.message(data)

    def message(self,cmd):
        self.pub.publish(cmd)
        rospy.loginfo(f'{cmd} - commander.py')




if __name__=='__main__':
    node=SendingNode()
    rospy.spin()
    