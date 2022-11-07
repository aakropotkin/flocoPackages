{

  inputs.packument.url   = "https://registry.npmjs.org/escalade?rev=8-6803b64bc7b7a8117a1080790b485af5";
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
    ident = "escalade";
    ldir  = "info/unscoped/e/escalade";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
