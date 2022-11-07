{

  inputs.packument.url   = "https://registry.npmjs.org/jss-plugin-camel-case?rev=53-9d45152a86aa16fce414c5d126e701b1";
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
    ident = "jss-plugin-camel-case";
    ldir  = "info/unscoped/j/jss-plugin-camel-case";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
