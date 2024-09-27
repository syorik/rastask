package app

import (
	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/widget"
)

type App struct {
	fyneApp fyne.App
	window  fyne.Window
}

func NewApp() *App {
	a := &App{
		fyneApp: app.New(),
	}
	a.window = a.fyneApp.NewWindow("Rasptask")
	a.window.Resize(fyne.NewSize(1024, 600))
	return a
}

func (a *App) Run() {
	content := container.NewVBox(
		widget.NewLabel("Welcome to Rasptask!"),
		widget.NewButton("Click me!", func() {
			// Add button functionality here
		}),
	)

	a.window.SetContent(content)
	a.window.ShowAndRun()
}
