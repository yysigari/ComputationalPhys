#install library
conda install -c conda-forge pyqt5
#from PyQt5.QtWidgets import QApplication, QWidget,  QPushButton,  QMainWindow

import PyQt5.QtWidgets as qtw
class MainWindow(qtw.QWidget):
    def __init__(self):
        super().__init__()
        #Add a Title
        self.setWindowTitle("Physics Calculator")
        #Set a vertical box layout
        self.setLayout(qtw.QVBoxLayout())
        #create a label
        my_label = qtw.QLabel("This is a calculator")
        #change the font
       # my_label.setFont(qtg.QFont('Helvetica',18))
        self.layout().addWidget(my_label)
        
        #create an entry box
        my_entry = qtw.QLineEdit()
        my_entry.setObjectName('name_field')
        my_entry.setText('Place Holder Text')
        self.layout().addWidget(my_entry)
        
        #Create a button
        my_button = qtw.QPushButton('Press Me!',
                                   clicked = lambda: press_it())
        self.layout().addWidget(my_button)
        
        #show the app
        self.show()
        def press_it():
            #Add name to label
            my_label.setText(f'Hello {my_entry.text()}')
            #Clear The entry box
            my_entry.setText('')
            
            
            
app = qtw.QApplication([])        
mw = MainWindow()
#Run the app
app.exec_()
