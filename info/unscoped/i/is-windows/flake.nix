{

  inputs.packument.url   = "https://registry.npmjs.org/is-windows?rev=13-dd7d1a55fa30e592ef3aab7a5be059bd";
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
    ident = "is-windows";
    ldir  = "info/unscoped/i/is-windows";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
