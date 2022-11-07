{

  inputs.packument.url   = "https://registry.npmjs.org/ent?rev=42-384175822c56f91a5c2676657044a3af";
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
    ident = "ent";
    ldir  = "info/unscoped/e/ent";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
