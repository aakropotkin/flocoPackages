{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-computed-properties?rev=82-eac9fb1ac2fd2f4d12bebcfe7f00846e";
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
    ident = "@babel/plugin-transform-computed-properties";
    ldir  = "info/babel/plugin-transform-computed-properties";
    inherit packument fetchInfo;
  } // latest';

}
