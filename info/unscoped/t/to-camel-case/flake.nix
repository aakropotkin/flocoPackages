{

  inputs.packument.url   = "https://registry.npmjs.org/to-camel-case?rev=20-c0c8da617cb86b3e0142b92b47bdd2c1";
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
    ident = "to-camel-case";
    ldir  = "info/unscoped/t/to-camel-case";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
