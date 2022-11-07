{

  inputs.packument.url   = "https://registry.npmjs.org/dezalgo?rev=42-6bbd0b74556aa5c5f3ddcb6c5d112856";
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
    ident = "dezalgo";
    ldir  = "info/unscoped/d/dezalgo";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
