CREATE TABLE [dbo].[Alchemy]
(
[AlchemyId] [int] NOT NULL,
[AlchemyName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AlchemyDescriptionShort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementID] [int] NULL
) ON [PRIMARY]
ALTER TABLE [dbo].[Alchemy] ADD 
CONSTRAINT [PK_Alchemy] PRIMARY KEY CLUSTERED  ([AlchemyId]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alchemy] ADD CONSTRAINT [FK_Alchemy_Element] FOREIGN KEY ([ElementID]) REFERENCES [dbo].[Element] ([ElementID])
GO
