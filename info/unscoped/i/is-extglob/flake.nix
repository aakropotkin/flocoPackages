{

  inputs.packument.url   = "https://registry.npmjs.org/is-extglob?rev=12-08c25f9d3b4cd5a290ae06b2df9299a3";
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
    ident = "is-extglob";
    ldir  = "info/unscoped/i/is-extglob";
    inherit packument fetchInfo;
  } // latest';

}
