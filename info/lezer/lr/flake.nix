{

  inputs.packument.url   = "https://registry.npmjs.org/@lezer/lr?rev=19-b168e1432b32e0e30468fd068843c170";
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
    scope = "@lezer";
    ident = "@lezer/lr";
    ldir  = "info/lezer/lr";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
