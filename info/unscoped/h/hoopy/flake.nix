{

  inputs.packument.url   = "https://registry.npmjs.org/hoopy?rev=6-2c39626b205c0fdbcb9f401fb5b750ff";
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
    ident = "hoopy";
    ldir  = "info/unscoped/h/hoopy";
    inherit packument fetchInfo;
  } // latest';

}
