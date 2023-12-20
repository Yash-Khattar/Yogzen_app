package controller

import (
	"context"
	"fmt"
	"github/Yash-Khattar/yogzen-server/database"
	"github/Yash-Khattar/yogzen-server/model"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
)

var yogaCollection *mongo.Collection = database.OpenCollection(database.Client, "yoga")

func AddYoga() gin.HandlerFunc {
	return func(c *gin.Context) {

		ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
		defer cancel()
		var document []interface{}
		for _, yoga := range yogaData {
			yoga.ID = primitive.NewObjectID()

			document = append(document, bson.D{
				{"_id", yoga.ID},
				{"yoga_name", yoga.YogaName},
				{"steps_list", yoga.StepsList},
				{"step_duration", yoga.StepDuration},
				{"image_url", yoga.ImageUrl},
				{"health_tag", yoga.HealthTag},
				{"total_duration", yoga.TotalDuration},
			})
		}

		result, err := yogaCollection.InsertMany(ctx, document)
		if err != nil {
			msg := fmt.Sprint("User item was not created")
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error(), "message": msg})
			return
		}

		c.JSON(http.StatusOK, result)
	}

}

func GetYoga() gin.HandlerFunc {
	return func(c *gin.Context) {
		ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
		defer cancel()
		cursor, err := yogaCollection.Find(ctx, bson.M{})
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		var yoga []bson.M
		if err = cursor.All(ctx, &yoga); err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}
		c.JSON(http.StatusOK, yoga)
	}
}

var yogaData = []model.Yoga{
	{
		YogaName:      "Tadasana",
		StepsList:     []string{"Stand with your feet together and arms by your sides.", "Ground your weight evenly through both feet and engage thigh muscles.", "Inhale, raise your arms overhead with palms facing each other.", "Extend through the fingertips, lengthening your spine.", "Lift your chest, gaze forward, and keep your neck in line with the spine.", "Hold the pose for 30 seconds, breathing steadily.", "Exhale, lower your arms, and return to the starting position."},
		StepDuration:  []int{5, 5, 5, 10, 5, 30, 5},
		ImageUrl:      "https://drive.google.com/file/d/17eZEylWBIutBEJiPMJQgSa5vTZ6lb9Gr/view?usp=drive_link",
		HealthTag:     "Improves posture, strengthens thighs and ankles, reduces flat feet, and relieves sciatica pain. Tadasana also helps in increasing awareness, focus, and concentration. It is known to be beneficial for managing anxiety.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Uttanasana",
		StepsList:     []string{"Start in a standing position with your feet hip-width apart.", "Inhale and lift your arms overhead.", "Exhale and hinge at your hips, reaching your hands towards the floor.", "Keep your back straight and extend your spine.", "Hold the forward bend for 30 seconds, breathing deeply.", "Inhale and slowly return to the standing position."},
		StepDuration:  []int{5, 5, 10, 30, 5, 5},
		ImageUrl:      "https://drive.google.com/file/d/17pK8wB0VE7yM1u0G2vcPxjoya_PeI0zP/view?usp=drive_link",
		HealthTag:     "Stretches the hamstrings, calves, and hips. Relieves tension in the spine and may help reduce stress and anxiety.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Adho Mukha Svanasana",
		StepsList:     []string{"Start on your hands and knees in a tabletop position.", "Exhale and lift your hips towards the ceiling.", "Straighten your legs, bringing your heels towards the floor.", "Keep your head between your arms, looking towards your knees.", "Hold the downward-facing dog pose for 30 seconds, breathing deeply.", "Exhale and gently lower your knees to the floor."},
		StepDuration:  []int{5, 5, 10, 30, 5, 5},
		ImageUrl:      "https://drive.google.com/file/d/1XksdPWe3-60-d2oVo4F2mWPVwqY0Knr3/view?usp=drive_link",
		HealthTag:     "Strengthens the arms, shoulders, and legs. Stretches the spine and hamstrings. Helps to relieve stress and mild depression.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Virabhadrasana I",
		StepsList:     []string{"Start in a standing position and step one foot back.", "Bend your front knee, keeping it directly above the ankle.", "Extend your arms overhead, with palms facing each other.", "Square your hips towards the front and gaze forward.", "Hold the warrior I pose for 30 seconds, breathing deeply.", "Inhale and return to the starting position. Repeat on the other side."},
		StepDuration:  []int{5, 10, 5, 30, 5, 5},
		ImageUrl:      "https://drive.google.com/file/d/1x7NEqof2EqXtxfYh7a3WvKjUYsoxaphF/view?usp=drive_link",
		HealthTag:     "Strengthens the legs, arms, and back. Improves balance and concentration. Stimulates abdominal organs.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Virabhadrasana II",
		StepsList:     []string{"Start in a standing position and step one foot back.", "Extend your arms parallel to the floor, palms facing down.", "Bend your front knee, keeping it directly above the ankle.", "Gaze over your front hand and square your hips to the side.", "Hold the warrior II pose for 30 seconds, breathing deeply.", "Inhale and return to the starting position. Repeat on the other side."},
		StepDuration:  []int{5, 10, 5, 30, 5, 5},
		ImageUrl:      "https://drive.google.com/file/d/1o4u-L__FRd8kbWCJzFwf1DgE9JP8S7aa/view?usp=drive_link",
		HealthTag:     "Strengthens the legs, arms, and shoulders. Improves stamina and concentration. Stretches the groins and chest.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Balasana",
		StepsList:     []string{"Start on your hands and knees in a tabletop position.", "Exhale and lower your hips towards your heels.", "Extend your arms forward and bring your forehead to the mat.", "Hold the child's pose for 30 seconds, breathing deeply.", "Inhale and return to the starting position."},
		StepDuration:  []int{5, 10, 10, 30, 5},
		ImageUrl:      "https://drive.google.com/file/d/1rG-w7p21mdqpEX1RcABLPemPOASg4pro/view?usp=drive_link",
		HealthTag:     "Relieves back and neck pain. Stretches the hips, thighs, and ankles. Calms the mind and reduces stress.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Savasana",
		StepsList:     []string{"Lie on your back with your legs extended and arms by your sides.", "Close your eyes and relax your entire body.", "Breathe deeply and allow yourself to surrender to the floor.", "Hold the corpse pose for 5 minutes or longer, focusing on your breath and letting go of tension."},
		StepDuration:  []int{5, 300, 5, 5},
		ImageUrl:      "https://drive.google.com/file/d/1M4fVzczux7HOYkUJo2HKmZ5dTA_M9C6P/view?usp=drive_link",
		HealthTag:     "Promotes deep relaxation and stress reduction. Improves concentration and mental clarity. Reduces insomnia and fatigue.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Paschimottanasana",
		StepsList:     []string{"Sit on the floor with your legs extended in front of you.", "Inhale and lengthen your spine.", "Exhale and hinge at your hips, reaching for your feet.", "Hold the seated forward bend for 30 seconds, breathing deeply.", "Inhale and return to the starting position."},
		StepDuration:  []int{5, 5, 10, 30, 5},
		ImageUrl:      "https://drive.google.com/file/d/1NSDAKqZfmi-8V7gY_1eGjCF1TgkSI8pX/view?usp=drive_link",
		HealthTag:     "Stretches the spine, hamstrings, and lower back. Calms the mind and reduces stress. Stimulates the liver, kidneys, and ovaries.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Bhujangasana",
		StepsList:     []string{"Lie on your stomach with your hands under your shoulders.", "Inhale and lift your chest off the mat, keeping your gaze forward.", "Engage your back muscles and lift your torso as high as comfortable.", "Hold the cobra pose for 30 seconds, breathing deeply.", "Exhale and lower your chest back to the mat."},
		StepDuration:  []int{5, 5, 10, 30, 5},
		ImageUrl:      "https://drive.google.com/file/d/18bKXA93nFWGdTfnBQ2sjbMN7Jj1SeGId/view?usp=drive_link",
		HealthTag:     "Strengthens the spine, buttocks, and shoulders. Stimulates abdominal organs. Opens the heart and lungs.",
		TotalDuration: 0,
	},
	{
		YogaName:      "Ustrasana",
		StepsList:     []string{"Kneel on the mat with your knees hip-width apart.", "Inhale and lift your chest towards the ceiling, arching your back.", "Reach for your heels with your hands, keeping your neck in a neutral position.", "Hold the camel pose for 30 seconds, breathing deeply.", "Exhale and return to the starting position."},
		StepDuration:  []int{5, 10, 5, 30, 5},
		ImageUrl:      "https://drive.google.com/file/d/1SPZvHnJ4bwB5H6sCYRRLa5fZKFhzHHSy/view?usp=drive_link",
		HealthTag:     "Stretches the front of the body, thighs, and hip flexors. Strengthens the back and shoulders. Improves posture and digestion.",
		TotalDuration: 0,
	},
}
