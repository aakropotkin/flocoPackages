{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-class-properties?rev=94-cc6a7ac895bd5b25695fecb8d25930a3";
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
    scope = "@babel";
    ident = "@babel/plugin-proposal-class-properties";
    ldir  = "info/babel/plugin-proposal-class-properties";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
