#!/usr/bin/python


import Tkinter

# inherit from Tkinter.Tk, which is the base class for standard windows
class app_tk(Tkinter.Tk):

    def __init__(self,parent):
        # app_tk derives from Tkinter.Tk,
        # so we have to call the Tkinter.Tk constructor (Tkinter.Tk.__init__()).
        Tkinter.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        # layout manager: grid
        self.grid()

        self.entry = Tkinter.Entry(self)
        self.entry.grid(column=0,row=0,sticky='EW')
        self.entry.bind("<Return>", self.OnPressEnter)


        button = Tkinter.Button(self,text=u"Click me !",
                                command=self.OnButtonClick)
        button.grid(column=1,row=0)

        self.labelVariable = Tkinter.StringVar()
        label = Tkinter.Label(self, textvariable=self.labelVariable,
                              anchor="w",fg="white",bg="blue")
        label.grid(column=0,row=1,columnspan=2,sticky='EW')

        self.grid_columnconfigure(0,weight=1)
        self.resizable(True,False)

    def OnButtonClick(self):
        self.labelVariable.set("You clicked the button !")
        #print "You clicked the button !"

    def OnPressEnter(self,event):
        #print "You pressed enter !"
        self.labelVariable.set("You pressed enter !")


if __name__ == "__main__":
    app = app_tk(None)
    app.title('Tkinter application')
    app.mainloop()
