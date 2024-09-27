package app

import (
	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/theme"
	"fyne.io/fyne/v2/widget"
)

type ContentProvider interface {
	GetContent() fyne.CanvasObject
}

type ProjectsContent struct{}

func (p ProjectsContent) GetContent() fyne.CanvasObject {
	return widget.NewLabel("Projects content")
}

type TasksContent struct{}

func (t TasksContent) GetContent() fyne.CanvasObject {
	return widget.NewLabel("Tasks content")
}

type NotesContent struct{}

func (n NotesContent) GetContent() fyne.CanvasObject {
	return widget.NewLabel("Notes content")
}

type PasswordsContent struct{}

func (p PasswordsContent) GetContent() fyne.CanvasObject {
	return widget.NewLabel("Passwords content")
}

type DashboardContent struct{}

func (d DashboardContent) GetContent() fyne.CanvasObject {
	return widget.NewLabel("Dashboard content")
}

type WhatsNextContent struct{}

func (w WhatsNextContent) GetContent() fyne.CanvasObject {
	return widget.NewLabel("What's Next content")
}

type App struct {
	fyneApp fyne.App
	window  fyne.Window
	content fyne.CanvasObject
}

func NewApp() *App {
	a := &App{
		fyneApp: app.New(),
	}
	a.fyneApp.Settings().SetTheme(theme.DarkTheme())
	a.window = a.fyneApp.NewWindow("Rasptask")
	a.window.SetFullScreen(true)
	a.window.Canvas().SetOnTypedKey(func(k *fyne.KeyEvent) {
		if k.Name == fyne.KeyEscape {
			a.fyneApp.Quit()
		}
	})
	return a
}

func (a *App) Run() {
	tabs := container.NewAppTabs(
		container.NewTabItemWithIcon("Dashboard", theme.HomeIcon(), DashboardContent{}.GetContent()),
		container.NewTabItemWithIcon("What's Next", theme.ListIcon(), WhatsNextContent{}.GetContent()),
		container.NewTabItemWithIcon("Projects", theme.FolderIcon(), ProjectsContent{}.GetContent()),
		container.NewTabItemWithIcon("Tasks", theme.DocumentIcon(), TasksContent{}.GetContent()),
		container.NewTabItemWithIcon("Notes", theme.DocumentIcon(), NotesContent{}.GetContent()),
		container.NewTabItemWithIcon("Passwords", theme.ConfirmIcon(), PasswordsContent{}.GetContent()),
	)

	tabs.SetTabLocation(container.TabLocationLeading)

	a.content = container.NewBorder(
		widget.NewLabel("Rasptask"),
		nil, nil, nil,
		tabs,
	)

	a.window.SetContent(a.content)
	a.window.ShowAndRun()
}
