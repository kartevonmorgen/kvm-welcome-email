module WelcomeEmail.Shared.Boundary where

import Data.JSDate (JSDate)
import Data.Maybe (Maybe(..))
import WelcomeEmail.Shared.Entry (Entry)

type Email =
  { subject :: String
  , body :: String
  }

type AuthConfig =
  { user :: String
  , pass :: String
  }

type NodeMailerConfig =
  { host :: String
  , port :: Int
  , secure :: Boolean
  , auth :: AuthConfig
  }

type Settings
  = { nodeMailer :: NodeMailerConfig
    , defaultEntry :: Entry
    , senderAddress :: String
    }

defaultSettings :: Settings
defaultSettings =
  { nodeMailer:
      { auth:
          { pass: ""
          , user: ""
          }
      , host: "in-v3.mailjet.com"
      , port: 587
      , secure: false
      }
  , defaultEntry:
      { id: "4c20979fe0754e74875afa4308d73ce7"
      , title: "Slowtec GmbH"
      , created: 1234.0
      , version: 33
      , contact_name: Just "Slowtec"
      , email: Just "post@slowtec.de"
      , lat: 37.2
      , lng: 120.7
      , country: Nothing
      }
  , senderAddress: ""
  }

type TestMailPayload = { emailAddr :: String }

type TestMailResponse = { error :: Maybe String }

type LoginData = { username :: String , password :: String }

type ServerErrorResponse = { error :: Maybe String }

type ErrorResponse = { error :: String }

type TokenResponse = { token :: String }

type LastLogEntry = { timestamp :: JSDate, type :: LastLogType }

data LastLogType
  = Error String
  | Warn String
  | EmailSent Entry

type LogLine =
  { timestamp :: String
  , level :: String
  , message :: String
  , wasSent :: Maybe Boolean
  , entry :: Maybe Entry
  }
