package model

import (
	"time"

	"go.mongodb.org/mongo-driver/bson/primitive"
)

type User struct {
	ID           primitive.ObjectID `json:"_id" bson:"_id"`
	Name         *string            `json:"name" validate:"required,min=2,max=100"`
	Email        *string            `json:"email" validate:"required,email"`
	Password     *string            `json:"password"`
	Token        *string            `json:"token"`
	RefreshToken *string            `json:"refresh_token"`
	UserType     *string            `json:"user_type" validate:"required,eq=ADMIN|eq=USER"`
	AvatarImage  *string            `json:"avatar_image"`
	CreatedAt    time.Time          `json:"created_at"`
	UpdatedAt    time.Time          `json:"updated_at"`
	UserId       string             `json:"user_id"`
}
