class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable
        
    has_attached_file :image, styles: { medium: "600x200>", thumb: "300x200>" }, 
        default_url: "https://s-media-cache-ak0.pinimg.com/564x/6c/28/c1/6c28c1644b26303b67cd2879355e8d0a.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
end
