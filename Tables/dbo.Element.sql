CREATE TABLE [dbo].[Element]
(
[ElementID] [int] NOT NULL,
[ElementName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElementDescriptionShort] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Element] ADD CONSTRAINT [PK_Element] PRIMARY KEY CLUSTERED  ([ElementID]) ON [PRIMARY]
GO
