#!/usr/bin/env python3

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from command_pkg.msg import sermon


class Worker:
    def __init__(self) -> None:
        rospy.init_node('WORKER', anonymous=True)
        self.pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
        rospy.Subscriber('command', sermon, self.clbk)


    def clbk(self, data):
        info = data
        velocity = Twist()
        
        speeding=round((info.speed)/6)
        cmd=info.advice.lower()

        rospy.loginfo(f'{speeding} {cmd}  - publisher.py')

        if cmd == 'forward':
            velocity.linear.x = speeding
        elif cmd == 'backward':
            velocity.linear.x = -speeding
        elif cmd == 'right':
            velocity.angular.z = -speeding
        elif cmd == 'left':
            velocity.angular.z = speeding
        elif cmd == 'stop':
            pass

        self.pub.publish(velocity)

if __name__ == '__main__':
    node = Worker()
    rospy.spin()
