CREATE TABLE [dbo].[MWeapon]
(
[MWeaponId] [bigint] NOT NULL,
[Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dice] [int] NULL CONSTRAINT [DF_MWeapon_Dice] DEFAULT ((6)),
[CreateDate] [datetime] NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MWeapon] ADD CONSTRAINT [PK_MWeapon] PRIMARY KEY CLUSTERED  ([MWeaponId]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWeapon] ON [dbo].[MWeapon] ([Name]) ON [PRIMARY]
GO
