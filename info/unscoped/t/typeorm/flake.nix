{

  inputs.packument.url   = "https://registry.npmjs.org/typeorm?rev=717-e009108a50c410ef1ea8e392c229ed06";
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
    ident = "typeorm";
    ldir  = "info/unscoped/t/typeorm";
    inherit packument fetchInfo;
  } // latest';

}
