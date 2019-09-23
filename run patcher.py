import subprocess
import tkinter as tk

root= tk.Tk() 
   
canvas1 = tk.Canvas(root, width = 350, height = 250) 
canvas1.pack()

def start_batch(): 
       subprocess.call([r'C:\Users\Brett\Documents\GitHub\Patcher_\make_patch.cmd'])
           
button1 = tk.Button (root, text='Start Patcher',command=start_batch)
canvas1.create_window(170, 130, window=button1)
root.mainloop()
exit()