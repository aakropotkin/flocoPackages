{

  inputs.packument.url   = "https://registry.npmjs.org/is-core-module?rev=23-374183aabb5f649692eb04d93572cdce";
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
    ident = "is-core-module";
    ldir  = "info/unscoped/i/is-core-module";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
