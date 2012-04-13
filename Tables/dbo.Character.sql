CREATE TABLE [dbo].[Character]
(
[CharacterID] [bigint] NOT NULL IDENTITY(1, 1),
[FName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prefix] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tile] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RaceID] [int] NULL,
[GenderID] [int] NULL,
[Class1ID] [int] NULL,
[Class2ID] [int] NULL,
[Class3ID] [int] NULL,
[Age] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Character] ADD CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED  ([CharacterID]) ON [PRIMARY]
GO
