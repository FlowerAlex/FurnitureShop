DECLARE @adminId UNIQUEIDENTIFIER = 'bb95bdc2-d84f-4bfd-9dd9-8e71b670a1ed';
DECLARE @now DATETIME2 = SYSUTCDATETIME();

IF (SELECT COUNT(*) FROM [auth].[AspNetUsers] WHERE [Id] = @adminId) = 0
BEGIN
    INSERT INTO [auth].[AspNetUsers]
        ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed],
        [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed],
        [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount])
    VALUES
        (@adminId, N'test@leancode.pl', N'TEST@LEANCODE.PL', N'test@leancode.pl', N'TEST@LEANCODE.PL', 1,
        N'AQAAAAEAACcQAAAAEMz+bgIB1WOgGeZUo03fZIINh6yMWo3acB2OlTVc0Dyp1wS4ZM5HrcmD2xfszw9Opg==', N'WFL7ORSGFLB2OJWAL2QV4BDH7SFVKLHO', N'ddd77722-24df-4bc9-863e-c97413a94486', NULL, 0,
        0, NULL, 1, 0);

    INSERT INTO [auth].[AspNetUserClaims]
        ([UserId], [ClaimType], [ClaimValue])
    VALUES
        (@adminId, 'role', 'admin'),
        (@adminId, 'role', 'user')
END