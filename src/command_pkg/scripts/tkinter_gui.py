#!/usr/bin/env python3

import tkinter as tk
from tkinter import ttk
import rospy
from command_pkg.msg import sermon
import threading
from nav_msgs.msg import Odometry

main_message = sermon()
information = ""  # Declare information as a global variable

class Pathacchi:
    def __init__(self) -> None:
        rospy.init_node('PATHACCHI', anonymous=True)
        self.pub = rospy.Publisher('button_er_value', sermon, queue_size=1)
        rospy.Subscriber('odom', Odometry, self.odom_callback)

    def odom_callback(self, data):
        global information
        position = data.pose.pose.position
        X = position.x
        Y = position.y
        information = f"X={X}\nY={Y}"
        rospy.loginfo(f'{information}')

    def send(self, cmd):
        self.pub.publish(cmd)
        rospy.loginfo(f"{cmd.advice} {cmd.speed} - tkinter_gui.py")

    def run(self):
        rospy.loginfo(f"PATHACCHI Node Working")
        while not rospy.is_shutdown():
            cmd = main_message
            self.send(cmd)
            rospy.sleep(1)

def button_clicked(position):
    main_message.advice = position

def scaling(position):
    main_message.speed = position

def key_press(event):
    key = event.keysym
    if key == 'w':
        button_clicked("FORWARD")
    elif key == 's':
        button_clicked("STOP")
    elif key == 'x':
        button_clicked("BACKWARD")
    elif key == 'a':
        button_clicked("LEFT")
    elif key == 'd':
        button_clicked("RIGHT")

def buttonGui():
    window = tk.Tk()
    window.geometry('575x403')
    window.resizable(width=False, height=False)
    window.title("Wheel Button GUI")

    main_frame = tk.Frame(window, bg='#020f12')
    main_frame.pack(fill=tk.BOTH, expand=True)

    scale_int = tk.IntVar(value=10)
    scale = ttk.Scale(
        main_frame,
        command=lambda value: scaling(scale_int.get()),
        from_=0,
        to=25,
        variable=scale_int
    )

    l = tk.Label(
        main_frame,
        text='Interplanetar',
        background='gray',
        foreground='BLACK',
        highlightthickness=2,
        highlightbackground='white',
        highlightcolor='WHITE',
        width=12,
        height=1,
        bd=0,
        border=0,
        font=('Arial', 16, 'bold')
    )

    dynamic_label = tk.Label(
        main_frame,
        text=information,
        background='gray',
        foreground='BLACK',
        highlightthickness=2,
        highlightbackground='white',
        highlightcolor='WHITE',
        width=25,
        height=3,
        bd=0,
        border=0,
        font=('Arial', 16, 'bold')
    )
    speed_label=tk.Label(
        main_frame,
        text=f'Speed = {main_message.speed}',
        background='gray',
        foreground='BLACK',
        highlightthickness=2,
        highlightbackground='white',
        highlightcolor='WHITE',
        width=10,
        height=1,
        bd=0,
        border=0,
        font=('Arial', 16, 'bold')
    )

    def update_dynamic_label():
        dynamic_label.config(text=information)
        speed_label.config(text=f'Speed = {main_message.speed}')
        window.after(100, update_dynamic_label)  # Schedule the update after 100 milliseconds

    # Buttons
    top_button = tk.Button(
        main_frame,
        background='#65e7ff',
        foreground='BLACK',
        activebackground='gray',
        activeforeground='BLACK',
        highlightthickness=2,
        highlightbackground='white',
        highlightcolor='WHITE',
        width=9,
        height=1,
        bd=0,
        border=0,
        text='FORWARD',
        font=('Arial', 16, 'bold'),
        command=lambda: button_clicked("Forward")
    )

    middle_button = tk.Button(
        main_frame,
        background='#65e7ff',
        foreground='BLACK',
        activebackground='gray',
        activeforeground='BLACK',
        highlightthickness=2,
        highlightbackground='white',
        highlightcolor='WHITE',
        width=8,
        height=1,
        bd=0,
        border=0,
        text='STOP',
        font=('Arial', 16, 'bold'),
        command=lambda: button_clicked("STOP")
    )

    bottom_button = tk.Button(
        main_frame,
        background='#65e7ff',
        foreground='BLACK',
        activebackground='gray',
        activeforeground='BLACK',
        highlightthickness=2,
        highlightbackground='white',
        highlightcolor='WHITE',
        width=9,
        height=1,
        bd=0,
        border=0,
        text='BACKWARD',
        font=('Arial', 16, 'bold'),
        command=lambda: button_clicked("BACKWARD")
    )

    left_button = tk.Button(
        main_frame,
        background='#65e7ff',
        foreground='BLACK',
        activebackground='gray',
        activeforeground='BLACK',
        highlightthickness=2,
        highlightbackground='white',
        highlightcolor='WHITE',
        width=8,
        height=1,
        bd=0,
        border=0,
        text='LEFT',
        font=('Arial', 16, 'bold'),
        command=lambda: button_clicked("LEFT")
    )

    right_button = tk.Button(
        main_frame,
        background='#65e7ff',
        foreground='BLACK',
        activebackground='gray',
        activeforeground='BLACK',
        highlightthickness=2,
        highlightbackground='white',
        highlightcolor='WHITE',
        width=8,
        height=1,
        bd=0,
        border=0,
        text='RIGHT',
        font=('Arial', 16, 'bold'),
        command=lambda: button_clicked("RIGHT")
    )

    # Grid
    scale.grid(row=4, column=1)
    l.grid(row=0, column=1)
    dynamic_label.grid(row=7, column=1,pady=23)
    speed_label.grid(row=3, column=2)
    top_button.grid(row=1, column=1, pady=27, padx=50)
    middle_button.grid(row=2, column=1)
    bottom_button.grid(row=3, column=1, pady=27)
    left_button.grid(row=2, column=0, padx=6)
    right_button.grid(row=2, column=2)

    window.after(100, update_dynamic_label)  # Schedule the initial update

    # Bind key presses to the key_press function
    window.bind('<Key>', key_press)

    window.mainloop()

if __name__ == '__main__':
    gui_thread = threading.Thread(target=buttonGui)
    gui_thread.start()  # Start the GUI

    node = Pathacchi()
    node.run()

    gui_thread.join()  # Wait for the GUI thread to finish
