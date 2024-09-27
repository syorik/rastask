import tkinter as tk
from tkinter import ttk
import customtkinter as ctk

class PersonalManagerApp(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Personal Manager")
        self.geometry("1024x600")
        self.configure(bg="#2c3e50")

        # Create main frame
        self.main_frame = tk.Frame(self, bg="#2c3e50")
        self.main_frame.pack(fill=tk.BOTH, expand=True)

        # Create navigation bar
        self.nav_frame = tk.Frame(self.main_frame, bg="#34495e", width=200)
        self.nav_frame.pack(side=tk.LEFT, fill=tk.Y)

        # Create content area
        self.content_frame = tk.Frame(self.main_frame, bg="#ecf0f1")
        self.content_frame.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True)

        self.create_nav_buttons()

    def create_nav_buttons(self):
        buttons = [
            ("Tasks", self.show_tasks),
            ("Notes", self.show_notes),
            ("Passwords", self.show_passwords),
            ("Settings", self.show_settings)
        ]

        for text, command in buttons:
            btn = ctk.CTkButton(
                self.nav_frame,
                text=text,
                command=command,
                fg_color="#3498db",
                hover_color="#2980b9",
                corner_radius=10,
                width=180
            )
            btn.pack(pady=10)

    def show_tasks(self):
        self.clear_content()
        icon = tk.PhotoImage(file="icons/tasks.png")
        icon_label = tk.Label(self.content_frame, image=icon, bg="#ecf0f1")
        icon_label.image = icon  # Keep a reference to prevent garbage collection
        icon_label.pack(pady=(20, 10))
        label = tk.Label(self.content_frame, text="Tasks", font=("Helvetica", 24), bg="#ecf0f1")
        label.pack(pady=10)

    def show_notes(self):
        self.clear_content()
        icon = tk.PhotoImage(file="icons/notes.png")
        icon_label = tk.Label(self.content_frame, image=icon, bg="#ecf0f1")
        icon_label.image = icon
        icon_label.pack(pady=(20, 10))
        label = tk.Label(self.content_frame, text="Notes", font=("Helvetica", 24), bg="#ecf0f1")
        label.pack(pady=10)

    def show_passwords(self):
        self.clear_content()
        icon = tk.PhotoImage(file="icons/passwords.png")
        icon_label = tk.Label(self.content_frame, image=icon, bg="#ecf0f1")
        icon_label.image = icon
        icon_label.pack(pady=(20, 10))
        label = tk.Label(self.content_frame, text="Passwords", font=("Helvetica", 24), bg="#ecf0f1")
        label.pack(pady=10)

    def show_settings(self):
        self.clear_content()
        icon = tk.PhotoImage(file="icons/settings.png")
        icon_label = tk.Label(self.content_frame, image=icon, bg="#ecf0f1")
        icon_label.image = icon
        icon_label.pack(pady=(20, 10))
        label = tk.Label(self.content_frame, text="Settings", font=("Helvetica", 24), bg="#ecf0f1")
        label.pack(pady=10)

    def clear_content(self):
        for widget in self.content_frame.winfo_children():
            widget.destroy()

if __name__ == "__main__":
    app = PersonalManagerApp()
    app.mainloop()
