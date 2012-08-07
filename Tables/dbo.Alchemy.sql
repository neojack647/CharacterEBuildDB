CREATE TABLE [dbo].[Alchemy]
(
[AlchemyId] [int] NULL,
[AlchemyName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AlchemyDescriptionShort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alchemy] ADD CONSTRAINT [FK_Alchemy_Element] FOREIGN KEY ([ElementID]) REFERENCES [dbo].[Element] ([ElementID])
GO
