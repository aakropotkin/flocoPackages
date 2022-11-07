{

  inputs.packument.url   = "https://registry.npmjs.org/wreck?rev=201-352629e99e1f4716a6411362bee4b670";
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
    ident = "wreck";
    ldir  = "info/unscoped/w/wreck";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
