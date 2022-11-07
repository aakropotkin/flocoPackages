{

  inputs.packument.url   = "https://registry.npmjs.org/before-after-hook?rev=23-0b7b8ad87ffc62bdbc303b00df1e21ac";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "before-after-hook";
    ldir  = "info/unscoped/b/before-after-hook";
    inherit packument fetchInfo;
  } // latest';

}
