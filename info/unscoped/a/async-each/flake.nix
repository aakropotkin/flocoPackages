{

  inputs.packument.url   = "https://registry.npmjs.org/async-each?rev=31-0b5ae5fa8243f53d16950885dc5529ee";
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
    ident = "async-each";
    ldir  = "info/unscoped/a/async-each";
    inherit packument fetchInfo;
  } // latest';

}
